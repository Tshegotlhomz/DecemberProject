import Foundation

class AnimeListViewModel: ObservableObject {
    @Published var searchText: String = ""
//
//    @Published var kitsu: Kitsu = Kitsu(data: <#[Datum]?#>, meta: <#KitsuMeta?#>, links: <#KitsuLinks?#>)
  

    var network: KitsuNetworkManager?

    func fetchAnime() {
        network?.fetchAnime()

    }




//    func search(name: String)  {
//
//        let kitsu = KitsuNetworkManager().fetchAnime
//
//    }




//    struct AnimeViewModel {
//
//        let kitsu: Kitsu
//
//        var id: String? {
//            kitsu.data.first?.id
//
//        }
//        var canonicalTitle: String? {
//            kitsu.data.first?.attributes?.canonicalTitle
//
//        }
//
//        var synopsis: String? {
//            kitsu.data.first?.attributes?.synopsis
//
//        }
//
//        var slug: String? {
//            kitsu.data.first?.attributes?.slug
//        }
//
//        var ageRatingGuide: String? {
//            kitsu.data.first?.attributes?.ageRatingGuide
//        }
//
//        var averageRating: String? {
//            kitsu.data.first?.attributes?.averageRating
//        }
//
//        var coverImage: CoverImage? {
//            kitsu.data.first?.attributes?.coverImage
//        }
//
//
//
//
//    }
}
