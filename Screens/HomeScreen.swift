
import SwiftUI

struct HomeScreenView: View{
    @StateObject private var anineNetworkManger = AnimeListViewModel()
    @ObservedObject var kitsuNetworkManager = KitsuNetworkManager()
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Movies", "Series", "Action"]
    var card : Attributes?
    @State var searchText: String = ""
    var searchResults: [Datum]?{
        let list = kitsuNetworkManager.kitsu?.data
        return searchText == "" ? list : list?.filter {
            guard let canonicalTitle = $0.attributes?.canonicalTitle else{
                return false
            }
           return canonicalTitle.lowercased().contains(searchText.lowercased())
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Text("Anime Shows")
                    .font(.title).bold()
                Color(.darkGray)
                    .edgesIgnoringSafeArea(.all)

                VStack (alignment: .leading) {
                    TagLineView()
                        .padding()

                    SearchBarView(searchText: $searchText)

                    if !searchText.isEmpty {
                        List {
                            ForEach(searchResults ?? [], id: \.self) { data in
                                Text(data.attributes?.canonicalTitle ?? "")
                            }
                        }
                    } else {

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    //if isActive == 1 then it's active
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }                        }
                            }
                            .padding()
                        }

                        Text("Shows you'll like")
                            .fontWeight(.semibold)
                            .font(.system(size: 26))
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(kitsuNetworkManager.kitsu?.data ?? [], id: \.self) { item in
                                    NavigationLink(destination: DetailScreenView(card: item.attributes), label: {
                                        ShowCardView(card: item.attributes)
                                    })
                                    .navigationBarHidden(false)
                                    .foregroundColor(.black)

                                }
                                .padding(.trailing)
                            }  .onAppear {
                                kitsuNetworkManager.fetchAnime()
                            }
                            .padding(.leading)
                        }



                    }

                    HStack{
                        BottonNavBarItem(image: Image(systemName: "magnifyingglass")){}
                        BottonNavBarItem(image: Image(systemName: "house")){}
                        BottonNavBarItem(image: Image(systemName: "heart")){}
                        BottonNavBarItem(image: Image(systemName: "person")){}

                    }
                    .padding()
                    .background(Color.gray)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                    .frame(maxHeight: .infinity, alignment: .bottom)

                }
            }
        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


struct TagLineView: View {
    var body: some View {
        Text("ANIWORLD")
            .fontDesign(.rounded)
            .font(.system(.largeTitle))
            .foregroundColor(.mint)
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    @State var kitsu:Kitsu?

    var body: some View {

        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search Anime", text: $searchText)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(8.0)
            .padding(.trailing)
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 24))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color(.systemMint): Color(.gray))

            if (isActive) {
                Color(.systemMint)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())

            }


        }
        .padding(.trailing)
    }
}

struct ShowCardView: View {
    var card : Attributes?
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card?.coverImage?.original ?? "" )){ image in
                                            image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20.0)
                                                .padding()
                                        } placeholder: {
                                            ProgressView()
                                        }


            Text(card?.titles?.en ?? "")
                .font(.title3)
                .fontWeight(.bold)

        }
        .frame(width: 200)
        .padding()
        .background(.mint)
        .cornerRadius(20.0)
    }

}

struct BottonNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
           image
                .frame(maxWidth: .infinity)

        })
    }
}
