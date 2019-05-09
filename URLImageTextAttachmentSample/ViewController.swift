//
//  ViewController.swift
//  URLImageTextAttachmentSample
//
//  Created by Jahyun Oh on 01/05/2019.
//  Copyright © 2019 Jahyun Oh. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let items: [Any] = [
        URL(string: "https://avatars0.githubusercontent.com/u/1327853")!,
        "Hello, World\n",
        "Read these books:",
        URL(string: "https://www.tuestudy.org/images/jmbook2.png")!,
//        " ",
        URL(string: "https://www.tuestudy.org/images/500l-lines.png")!,
//        " ",
        URL(string: "https://www.tuestudy.org/images/aosabook-vol.2.jpg")!
    ]

    private let tableView = UITableView()
    private let reloadButton = UIButton()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let textView = UITextView()
        textView.attributedText = buildAttrubtedString()

        view.addSubview(textView)
        textView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.bottom.equalTo(view.snp.centerY).offset(-10)
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.snp.centerY).offset(10)
            maker.leading.trailing.equalToSuperview().inset(20)
        }
        tableView.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.reuseID)
        tableView.rowHeight = TextViewCell.cellHeight
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(reloadButton)
        reloadButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(tableView.snp.bottom).offset(20)
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            maker.height.equalTo(30)
        }
        reloadButton.setTitle("Reload 🙂", for: .normal)
        reloadButton.setTitle("Reload 😁", for: .highlighted)
        reloadButton.rx.tap
            .subscribe(onNext: { [weak self] (_) in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }

    private func buildAttrubtedString() -> NSAttributedString {
        let placeholder = UIImage(color: .lightGray, size: CGSize(width: 50, height: 50))!
        let font = UIFont.systemFont(ofSize: 25)
        let attrubtedString = NSMutableAttributedString()

        items.forEach { (item) in
            switch item {
            case let url as URL:
                let attachement = URLImageTextAttachment(url: url, placeholderImage: placeholder, fitTo: font)
                attrubtedString.append(NSAttributedString(attachment: attachement))
            case let text as String:
                attrubtedString.append(NSAttributedString(string: text))
            default:
                break
            }
        }
        attrubtedString.addAttributes([ .font: font ], range: NSRange(location: 0, length: attrubtedString.length))
        return attrubtedString
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.reuseID, for: indexPath)

        let textView = (cell as? TextViewCell)?.textView

        let placeholder = UIImage(color: .lightGray, size: CGSize(width: 50, height: 50))!
        let font = UIFont.systemFont(ofSize: 25)

        switch items[indexPath.row] {
        case let url as URL:
            let attachement = URLImageTextAttachment(url: url, placeholderImage: placeholder, fitTo: font)
            textView?.attributedText = NSAttributedString(attachment: attachement)
        case let text as String:
            textView?.attributedText = NSAttributedString(string: text)
        default:
            assertionFailure()
        }

        return cell
    }
}
