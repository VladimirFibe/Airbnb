import SwiftUI

enum DestinationSearchOptions {
    case location
    case date
    case guests
}
struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption = DestinationSearchOptions.date
    @State private var startDate = Date()
    @State private var endDate = Date()

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
            }
            .padding(.horizontal)
            VStack(alignment: .leading) {
                if selectedOption == .location {
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
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .padding(.horizontal)
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }

            VStack {
                if selectedOption == .date {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding(.horizontal)
            .frame(height: selectedOption == .date ? 180 : 64)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .date }
                }

            VStack {
                if selectedOption == .guests {
                    Text("Show expanded view")
                        .frame(maxWidth: .infinity)
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding(.horizontal)
            .frame(height: selectedOption == .guests ? 120 : 64)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .guests }
                }
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
