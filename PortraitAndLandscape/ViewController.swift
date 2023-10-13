//
//  ViewController.swift
//  PortraitAndLandscape
//
//  Created by 김호세 on 10/13/23.
//

//#import "AutoLayoutHelper.h"
//#import "AutoLayoutHelper.h"

import UIKit

class ViewController: UIViewController {

  private lazy var button: UIButton = {
    let btn = UIButton()
    btn.setTitle("회전하기", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    btn.backgroundColor = .systemGray
    btn.translatesAutoresizingMaskIntoConstraints = false

    btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    return btn
  }()

  private lazy var moveButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("이동", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    btn.backgroundColor = .blue
    btn.translatesAutoresizingMaskIntoConstraints = false

    btn.addTarget(self, action: #selector(didTapMoveButton), for: .touchUpInside)
    return btn
  }()

  override var shouldAutorotate: Bool {
     return true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()

  }

  @objc
  private func didTapMoveButton() {
    let vc = ObjcViewController()
    vc.modalPresentationStyle = .fullScreen

    self.present(vc, animated: true)

  }

  @objc
  private func didTapButton() {

    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    (UIApplication.shared.delegate as! AppDelegate).allList = .landscapeRight

    if #available(iOS 16.0, *) {
      debugPrint("above 16.0")


      windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
      self.setNeedsUpdateOfSupportedInterfaceOrientations()

    } else {

      debugPrint("below 16.0")
      let value = UIDeviceOrientation.landscapeRight.rawValue
      UIDevice.current.setValue(value, forKey: "orientation")

    }

  }


  private func setupViews() {

    view.addSubview(button)

    view.addSubview(moveButton)

    NSLayoutConstraint.activate([

      button.widthAnchor.constraint(equalToConstant: 80),
      button.heightAnchor.constraint(equalToConstant: 80),

      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      moveButton.widthAnchor.constraint(equalToConstant: 80),
      moveButton.heightAnchor.constraint(equalToConstant: 80),

      moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      moveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),




    ])

  }


}
