import SwiftUI

enum DestinationSearchOptions {
    case location
    case date
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption = DestinationSearchOptions.location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var count = 1
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }) {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                }
                Spacer()
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            VStack(alignment: .leading) {
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search destinations", text: $destination)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke()
                        .foregroundStyle(Color(.systemGray4))
                }
            }
            .modifier(CollapsedPickerViewModifier(
                selectedOption: $selectedOption,
                value: .location, 
                title: "Where",
                description: "Add destination"
            ))

            VStack(alignment: .leading) {
                Text("When's your trip?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                    Divider()
                    DatePicker("To", selection: $endDate, displayedComponents: .date)
                }
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            .modifier(CollapsedPickerViewModifier(
                selectedOption: $selectedOption,
                value: .date,
                title: "When",
                description: "Add dates",
                height: 180
            ))

            VStack{
                Text("Who's coming?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Stepper {
                    Text("\(count) Adults")
                } onIncrement: {
                    count += 1
                } onDecrement: {
                    count -= 1
                }
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            .modifier(CollapsedPickerViewModifier(
                selectedOption: $selectedOption,
                value: .guests,
                title: "Who",
                description: "Add guests"
            ))

            Spacer()
        }
    }
}

struct CollapsedPickerView: View {
    var title: String
    var description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(description)
            }
        }
        .font(.subheadline)
        .fontWeight(.bold)
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}

struct CollapsedPickerViewModifier: ViewModifier {
    @Binding var selectedOption: DestinationSearchOptions
    var value: DestinationSearchOptions
    var title: String
    var description: String
    var height: CGFloat = 120
    func body(content: Content) -> some View {
        VStack {
            if selectedOption == value {
                content
            } else {
                CollapsedPickerView(title: title, description: description)
            }
        }
        .padding(.horizontal)
        .frame(height: selectedOption == value ? height : 64)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = value }
        }
    }
}
