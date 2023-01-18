

import SwiftUI

struct DetailScreenView: View {
    var card: Attributes?
    var body: some View {
        ZStack{
            Color(.darkGray)
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: Image(systemName: "chevron.backgrounds")
//                    .padding(.all, 12)
//                    .background(Color.white)
//                    .cornerRadius(3.0)
//                )

            VStack {

                DescriptionView(card: card)
                
                    


            }
        }
    }
}

struct DescriptionView: View {
    var card: Attributes?
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
        }
        ScrollView {
            Text(card?.titles?.en ?? "")
                .font(.title3)
                .fontWeight(.bold)

            VStack(spacing: 4) {
                Text(card?.slug ?? "")
                    .opacity(0.5)
                    .padding(.leading, 8)

            }



            HStack {
                VStack(alignment: .leading) {
                    Text("Description")
                        .fontWeight(.medium)
                    .padding(.vertical, 5)

                    Text(card?.synopsis ?? "")
                        .lineSpacing(6.0)
                        .opacity(0.6)
                        .padding(.vertical, 3)
                }
            }



//
            VStack () {
                    Text("Rating")
                        .fontWeight(.semibold)
                Text(card?.averageRating ?? "")
                        .opacity(0.6)


                VStack {
                    Text("Age Rating Guide")
                        .fontWeight(.semibold)
                }
                Text(card?.ageRatingGuide ?? "")
                        .opacity(0.6)

                }
        }
        .padding()
        .padding(.top)
        .background(Color(.darkGray))
        .cornerRadius(40.0)
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}
