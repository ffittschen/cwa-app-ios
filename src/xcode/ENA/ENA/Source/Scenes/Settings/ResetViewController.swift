// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import Foundation
import UIKit

protocol ResetDelegate: AnyObject {
	func reset()
}

final class ResetViewController: UIViewController {
	@IBOutlet var header1Label: DynamicTypeLabel!
	@IBOutlet var description1TextView: UITextView!
	@IBOutlet var resetButton: ENAButton!
	@IBOutlet var discardResetButton: ENAButton!
	@IBOutlet var infoTitleLabel: DynamicTypeLabel!
	@IBOutlet var infoDescriptionLabel: UILabel!
	@IBOutlet var infoView: UIView!
	@IBOutlet var subtitleLabel: UILabel!

	weak var delegate: ResetDelegate?

	@IBAction func resetData(_: Any) {
		delegate?.reset()
		dismiss(animated: true, completion: nil)
	}

	override func viewDidLoad() {
		setupView()
	}

	@IBAction func discard(_: Any) {
		dismiss(animated: true, completion: nil)
	}

	private func setupView() {
		navigationItem.title = AppStrings.Reset.navigationBarTitle
		navigationController?.navigationBar.prefersLargeTitles = true

		subtitleLabel.text = AppStrings.Reset.subtitle

		description1TextView.contentInset = .zero
		description1TextView.textContainer.lineFragmentPadding = 0

		header1Label.text = AppStrings.Reset.header1
		description1TextView.text = AppStrings.Reset.description1
		discardResetButton.setTitle(AppStrings.Reset.discardButton, for: .normal)

		infoView.layer.cornerRadius = 14
		infoTitleLabel.text = AppStrings.Reset.infoTitle
		infoDescriptionLabel.text = AppStrings.Reset.infoDescription

		resetButton.setTitle(AppStrings.Reset.resetButton, for: .normal)

		if let resetButton = resetButton, let titleLabel = resetButton.titleLabel {
			resetButton.addConstraint(NSLayoutConstraint(item: resetButton, attribute: .height, relatedBy: .equal, toItem: titleLabel, attribute: .height, multiplier: 1, constant: 0))
		}
	}
}
