// Midterm Project
// Taina Saenz
// October 21, 2025

import SwiftUI

// ContentView: holds content for destination view
struct ContentView: View {
    
    let destinations = Bundle.main.decode([Subject].self, from: "Data.json")
    var body: some View {
        NavigationView {
            List {
                // Navigation Link with views for the list of destinations I'd like to travel to
                ForEach(destinations) { destination in
                    NavigationLink(destination: DetailView(destination: destination)) {
                        DestinationRow(destination: destination)
                    }
                }
            }
            // Title of app/main navigation
            .navigationTitle("Taina's Travels")
        }
    }
}

// DestinationRow, which includes the name and the picture for each destination when you first see the app
struct DestinationRow: View {
    let destination: Subject
    
    var body: some View {
        HStack {
            // Image
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(8)
            
            // Name of destination
            Text(destination.name)
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}

// Details for each destination, the description, name, and image
struct DetailView: View {
    let destination: Subject
    
    var body: some View {
        // Allows scrolling in app
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("DESTINATION DETAILS")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top)
                
                // Image of destination
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                // Destination name
                Text(destination.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                
                // Description of destination
                Text(destination.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        // Navigation bar title
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
