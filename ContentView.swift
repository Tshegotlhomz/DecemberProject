

import SwiftUI
import CoreData



struct ContentView: View {
    @ObservedObject var kitsuNetworkManager = KitsuNetworkManager()

    var body: some View {

        ScrollView {
            Text("Anime Show")
                .font(.largeTitle).bold()


            Text(kitsuNetworkManager.kitsu?.data?.first?.attributes?.canonicalTitle ?? "")
                .font(.title2)
            AsyncImage(url: URL(string: kitsuNetworkManager.kitsu?.data?.first?.attributes?.coverImage?.large ?? "" )){ image in
                                            image
                                                .resizable()
                                                .aspectRatio( contentMode: .fill)
                                                .frame(width: 375,height: 400)
                                                .cornerRadius(15)
                                                .padding()
                                        } placeholder: {
                                            ProgressView()
                                        }
            ScrollView {

                Text(" Anime Description")
                    .bold()
                    .font(.title)

                Text(kitsuNetworkManager.kitsu?.data?.first?.attributes?.synopsis ?? "")
                    .padding()
                Text(kitsuNetworkManager.kitsu?.data?.first?.attributes?.ageRatingGuide ?? "")
                    .bold()
                    .padding(.leading,15)



            }


            



}
        .onAppear {
            kitsuNetworkManager.fetchAnime()
        }

    }



    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environmentObject(KitsuNetworkManager())
        }
    }

}



 



