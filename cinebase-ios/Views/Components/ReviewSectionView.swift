//
//  ReviewSectionView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct ReviewSectionView: View {
    
    let reviewVM: [ReviewViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.heightRatio * 10, content: {
            Text("Review")
                .font(.customTitle2)
            
            ForEach(self.reviewVM, id: \.id) { (reviewVM) in
                ReviewItem(reviewVM: reviewVM)
            }
        })
        .foregroundColor(.gray)
        .padding()
    }
}

struct ReviewItem: View {
    
    let reviewVM: ReviewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            HStack(alignment: .center, spacing: nil, content: {
                Text(reviewVM.authorDetails.username ?? "Unknown")
                    .font(.customHeading)
                Spacer()
                Text(reviewVM.updatedAt)
                    .font(.customBody)
            })
            HStack(alignment: .center, spacing: nil, content: {
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.yellow)
                Text("\(reviewVM.authorDetails.rating ?? 0, specifier: "%.1f")/10")
                    .font(.customBody)
            })
            Text(reviewVM.content)
                .font(.customBody)
                .lineLimit(3)
        })
    }
}

struct ReviewSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let reviewVM: [ReviewViewModel] = Constants.movieReviewPreviewData.map(ReviewViewModel.init)
        ReviewSectionView(reviewVM: reviewVM)
    }
}
