// Midterm Project
// Taina Saenz
// October 21, 2025

import SwiftUI

struct ContentView: View {
    
    let destination = Bundle.main.decode([Subject].self, from: "Data.json")
    var body: some View {
        NavigationView {
            List {
                
                ForEach(destination) { destination in
                    NavigationLink(destination: DetailView(destination: destination)) {
                        DestinationRow(destination: destination)
                    }
                }
            }
            .navigationTitle("Where I'd Like to Travel")
        }
    }
}

struct DestinationRow: View {
    let destination: Subject
    
    var body: some View {
        HStack {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(8)
            
            Text(destination.name)
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}

struct DetailView: View {
    let destination: Subject
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("DESTINATION DETAILS")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top)
                
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                Text(destination.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(destination.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
