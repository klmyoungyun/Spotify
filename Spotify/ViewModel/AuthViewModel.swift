//
//  AuthViewModel.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/17.
//

import Foundation
import RxSwift

protocol AuthViewModelInput {
    
}
protocol AuthViewModelOutput {
    
}
protocol AuthViewModelType: AuthViewModelInput,
                            AuthViewModelOutput { }

class AuthViewModel: AuthViewModelType {
    let disposeBag = DisposeBag()
}
