//
//  DiscoverView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject private var discoverVM: DiscoverViewModel = DiscoverViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 0, content: {
                
                Group {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Now Playing")
                            .font(.customTitle2)
                        Spacer()
                    })
                    .padding(.horizontal, Constants.heightRatio * 19)
                    .padding(.vertical)
                    
                    DiscoverBannerScrollView(movieVM: self.discoverVM.nowPlayingList)
                }
                
                Group {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Popular")
                            .font(.customTitle2)
                        Spacer()
                        Text("More")
                            .font(.customBody)
                    })
                    .padding(.horizontal, Constants.heightRatio * 19)
                    .padding(.vertical)
                    
                    DiscoverSectionScrollView(movieVM: self.discoverVM.popularList)
                }
                
                Group {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Top Rated")
                            .font(.customTitle2)
                        Spacer()
                        Text("More")
                            .font(.customBody)
                    })
                    .padding(.horizontal, Constants.heightRatio * 19)
                    .padding(.vertical)
                    
                    DiscoverSectionScrollView(movieVM: self.discoverVM.topRatedList)
                }
                
                Group {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Upcoming")
                            .font(.customTitle2)
                        Spacer()
                        Text("More")
                            .font(.customBody)
                    })
                    .padding(.horizontal, Constants.heightRatio * 19)
                    .padding(.vertical)
                    
                    DiscoverSectionScrollView(movieVM: self.discoverVM.upcomingList)
                }
                    .navigationTitle("Discover")
            })
            .padding(.bottom)
            .onAppear(perform: {
                self.discoverVM.loadData()
            })
        })
        .embedNavigationView()
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
