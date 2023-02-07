//
//  SpinnerView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.4)
            ProgressView()
                .scaleEffect(2)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
