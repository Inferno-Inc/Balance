import UIKit
import SparrowKit
import NativeUIKit
import Constants
import SPSafeSymbols

class SafariTableViewCell: SPTableViewCell {
    
    let closeButton = SPButton().do {
        $0.setImage(.init(SPSafeSymbol.xmark).alwaysTemplate)
        $0.tintColor = .secondaryLabel
    }
    
    let titleLabel = SPLabel().do {
        $0.text = Texts.Wallet.SafariExtension.propose_title
        $0.font = .preferredFont(forTextStyle: .title2, weight: .bold, addPoints: 1)
        $0.textColor = .label
        $0.numberOfLines = .zero
    }
    
    let desсriptionLabel = SPLabel().do {
        $0.text = Texts.Wallet.SafariExtension.propose_description
        $0.font = .preferredFont(forTextStyle: .body, weight: .regular, addPoints: -1)
        $0.textColor = .secondaryLabel
        $0.numberOfLines = .zero
    }
    
    let runButton = NativeSmallActionButton().do {
        $0.set(title: Texts.Wallet.SafariExtension.Steps.open, icon: nil, colorise: .tintedContentTertiaryGroupBackground)
    }
    
    let iconView = SPImageView().do {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .clear
        $0.image = Image.safari_icon
    }
    
    override func commonInit() {
        super.commonInit()
        selectionStyle = .none
        contentView.layoutMargins = .init(horizontal: NativeLayout.Spaces.default_less, vertical: NativeLayout.Spaces.default)
        contentView.addSubviews(titleLabel, desсriptionLabel, runButton, iconView, closeButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        closeButton.sizeToFit()
        closeButton.setMaxXToSuperviewRightMargin()
        closeButton.frame.origin.y = contentView.layoutMargins.top
        
        iconView.frame = .init(side: 48)
        iconView.frame.origin.x = contentView.layoutMargins.left
        
        let space: CGFloat = NativeLayout.Spaces.default_more
        let labelWidth = contentView.layoutWidth - iconView.frame.width - space
        titleLabel.layoutDynamicHeight(x: iconView.frame.maxX + space, y: closeButton.frame.origin.y + NativeLayout.Spaces.step, width: labelWidth)
        desсriptionLabel.layoutDynamicHeight(x: titleLabel.frame.origin.x, y: titleLabel.frame.maxY + NativeLayout.Spaces.step, width: titleLabel.frame.width)
        
        iconView.frame.origin.y = titleLabel.frame.origin.y
        
        runButton.sizeToFit()
        runButton.frame.origin.x = titleLabel.frame.origin.x
        runButton.frame.origin.y = desсriptionLabel.frame.maxY + NativeLayout.Spaces.default_less
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layoutSubviews()
        return .init(width: size.width, height: runButton.frame.maxY + contentView.layoutMargins.bottom + 2)
    }
}
