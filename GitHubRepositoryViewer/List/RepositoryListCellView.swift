import Foundation
import SwiftUI

struct RepositoryListCellView : View{
    var repository : Repository
    let screen: CGRect = UIScreen.main.bounds
    @State var image = Image("")
    var imageViewModel = ImageViewModel()
    @State private var showingSheet = false
    @State var languageColor : Color
    var body : some View{
        
        
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .frame(height: screen.height/7)
                .onTapGesture {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    ScrollView{
                        RepositoryDetailView(repository: repository,image: image,languageColor: languageColor)
                    }
                }
            
            RepositoryCellContentView(repository: repository, image: image,languageColor: languageColor)
            
        }
        .modifier(SearchContextMenuModifier())
        .task{
            await imageViewModel.getImage(from: repository.owner?.avatar_url)
            if let unwrappedImage = imageViewModel.image{
                image = Image(uiImage: unwrappedImage)
            }
        }
    }
    
}


