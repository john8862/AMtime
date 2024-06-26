//
//  SectionView.swift
//  AMtime
//
//  Created by zerui song on 29/4/2024.
//

import SwiftUI

struct SectionView: View {
    var sectionType: HomeSection = .NowPlaying
    var allItems: [HomeSection: [MovieViewModel]]
    @Binding var seeSection: HomeSection?
    @Binding var selectedMovie: MovieViewModel?

    var data = [Int]()
    
    var body: some View {
        return VStack(spacing: 5) {
            HStack {
                Text(sectionType.rawValue)
                    .font(.title2)
                    .bold()

                Spacer()

                Button(action: {
                    seeSection = sectionType
                }, label: {
                    Text("See all")
                })
            }.padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                switch sectionType {
                case .NowPlaying:
                    DynamicContainer(data: allItems[sectionType]) { value in
                        NowPlayingView(movie: value)
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .onTapGesture {
                                self.selectedMovie = value
                            }
                    }.frame(height: 220)

                case .Popular:
                    DynamicContainer(data: allItems[sectionType]) { value in
                        PopularView(movie: value)
                            .frame(width: UIScreen.main.bounds.width / 2 - 40)
                            .onTapGesture {
                                self.selectedMovie = value
                            }
                    }

                case .Upcoming:
                    DynamicContainer(data: allItems[sectionType], type: .grid) { value in
                        UpcomingView(movie: value)
                            .padding(.horizontal, 20)
                            .frame(width: UIScreen.main.bounds.width)
                            .onTapGesture {
                                self.selectedMovie = value
                            }
                    }.padding(.top, 5)

                case .TopRated:
                    DynamicContainer(data: allItems[sectionType]) { value in
                        PopularView(movie: value)
                            .frame(width: UIScreen.main.bounds.width / 2 - 40)
                            .onTapGesture {
                                self.selectedMovie = value
                            }
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(allItems: [:], seeSection: .constant(.NowPlaying), selectedMovie: .constant(MovieViewModel.default))
    }
}
