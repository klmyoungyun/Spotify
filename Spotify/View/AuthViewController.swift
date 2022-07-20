//
//  AuthViewController.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/17.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

class AuthViewController: UIViewController {
    private let viewModel: AuthViewModelType
    private var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    init(viewModel: AuthViewModelType = AuthViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.viewModel = AuthViewModel()
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    // MARK: - UI
    private lazy var backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "login")
    }
    private lazy var iconImage = UIImageView().then {
        $0.image = UIImage(named: "ic_spotify_white")
    }
    private lazy var titleLabel = UILabel().then {
        $0.attributedText = .attributedString(type: .bold,
                                              text: "내 마음에 꼭 드는 또 다른 플레이리스트를 발견해보세요.",
                                              size: 28,
                                              color: .white)
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }
    private lazy var signUpButton = UIButton().then {
        $0.configuration = self.configureButton(text: "가입하기",
                                                textColor: UIColor.black)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .spotifyGreen
    }
    private lazy var googleLoginButton = UIButton().then {
        $0.configuration = self.configureButton(text: "Google로 계속하기",
                                                textColor: UIColor.white)
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(hex: 0x595959).cgColor
    }
    private lazy var facebookLoginButton = UIButton().then {
        $0.configuration = self.configureButton(text: "Facebook으로 계속하기",
                                                textColor: UIColor.white)
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(hex: 0x595959).cgColor
    }
    private lazy var appleLoginButton = UIButton().then {
        $0.configuration = self.configureButton(text: "Apple로 계속하기",
                                                textColor: UIColor.white)
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(hex: 0x595959).cgColor
    }
    private lazy var loginButton = UIButton().then {
        $0.configuration = self.configureButton(text: "로그인하기",
                                                textColor: UIColor.white)
        $0.layer.cornerRadius = 25
    }
    private lazy var loginStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 10
    }
}

// MARK: Constraints
private extension AuthViewController {
    func setUI() {
        view.backgroundColor = .black
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(iconImage)
        view.addSubview(loginStackView)
        [signUpButton, googleLoginButton,
         facebookLoginButton, appleLoginButton,loginButton]
            .forEach { loginStackView.addArrangedSubview($0)
            }
    }
    func setConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImage)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        iconImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-20)
            make.width.height.equalTo(42)
        }
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        [signUpButton, googleLoginButton,
         facebookLoginButton, appleLoginButton,loginButton].forEach {
            $0.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.height.equalTo(50)
            }
        }
    }
    func setBinding() {
        
    }
    func configureButton(text: String,
                         textColor: UIColor?) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        var title = AttributedString.init(text)
        title.font = UIFont.NotoSans(.semiBold, size: 16)
        title.foregroundColor = textColor
        config.attributedTitle = title
        config.contentInsets = NSDirectionalEdgeInsets(top: 15,
                                                             leading: 0,
                                                             bottom: 15,
                                                             trailing: 0)
        return config
    }
}
