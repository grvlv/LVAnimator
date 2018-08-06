// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

/** A wrapper class for Objective-C compatibility. */
public extension Iconic {

    /** The icon font's family name. */
    @objc class var iconFamilyName: NSString {
        return Icon.familyName as NSString
    }

    /** The icon font's total count of available icons. */
    @objc class var iconCount: Int {
        return Icon.count
    }

    /**
     Returns the icon font object for the specified size.

     - parameter size: The size (in points) to which the font is scaled.
     */
    @objc class func iconFont(ofSize size: CGFloat) -> UIFont {
        return Icon.font(ofSize: size)
    }

    /**
     Returns the icon as an attributed string with the given pointSize and color.

     - parameter icon: The icon type.
     - parameter pointSize: The size of the font.
     - parameter color: The tint color of the font.
     */
    @objc class func attributedString(withIcon icon: Icon, pointSize: CGFloat, color: UIColor?) -> NSAttributedString {
        return icon.attributedString(ofSize: pointSize, color: color)
    }

    /**
     Returns the icon as an attributed string with the given pointSize, color and padding.

     - parameter icon: The icon type.
     - parameter pointSize: The size of the font.
     - parameter color: The tint color of the font.
     - parameter edgeInsets: The edge insets to be used as horizontal and vertical padding.
     */
    @objc class func attributedString(withIcon icon: Icon, pointSize: CGFloat, color: UIColor?, edgeInsets: UIEdgeInsets) -> NSAttributedString {
        return icon.attributedString(ofSize: pointSize, color: color, edgeInsets: edgeInsets)
    }

    /**
     Returns the icon as an image with the given size and color.

     - parameter icon: The icon type.
     - parameter size: The size of the image, in points.
     - parameter color: A tint color for the image.
     */
    @objc class func image(withIcon icon: Icon, size: CGSize, color: UIColor?) -> UIImage {
        return icon.image(ofSize: size, color: color)
    }

    /**
     Returns the icon as an image with the given size and color.

     - parameter icon: The icon type.
     - parameter size: The size of the image, in points.
     - parameter color: The tint color of the image.
     - parameter edgeInsets: The edge insets to be used as padding values.
     */
    @objc class func image(withIcon icon: Icon, size: CGSize, color: UIColor?, edgeInsets: UIEdgeInsets) -> UIImage {
        return icon.image(ofSize: size, color: color, edgeInsets: edgeInsets)
    }

    /**
     Registers the icon font with the font manager.
     Note: an exception will be thrown if the resource (ttf/otf) font file is not found in the bundle.
     */
    @objc class func registerIcon() {
        Icon.register()
    }

    /**
     Unregisters the icon font from the font manager.
     */
    @objc class func unregisterIcon() {
        Icon.unregister()
    }
}

#if os(iOS) || os(tvOS)

/** An IconImageView subclass capable of rendering icons, compatible with Interface Builder. iOS and tvOS only. */
@IBDesignable
public final class IconView: IconImageView {

    /** The icon string name (Interface Builder only). */
    @IBInspectable
    @available(*, unavailable, message : "This attribute is restricted to be used in Interface Builder.")
    dynamic public var iconName: String = "" {
        willSet {
            iconDrawable = Icon(named: newValue)
        }
    }

    @available(*, unavailable, message : "This function is restricted to be used in Interface Builder.")
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        // The icon font needs to be registered first.
        Icon.register()
    }
}

public extension UIBarButtonItem {

    /**
     Initializes a new item using the specified icon and other properties.

     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    convenience init(withIcon icon: Icon, size: CGSize, target: AnyObject?, action: Selector) {
        let image = icon.image(ofSize: size, color: .black)
        self.init(image: image, style: .plain, target: target, action: action)
    }
}

public extension UITabBarItem {

    /**
     Initializes a new item using the specified icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.

     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter title: The item's title. If nil, a title is not displayed.
     */
    convenience init(withIcon icon: Icon, size: CGSize, title: String?) {
        let image = icon.image(ofSize: size, color: .black)
        self.init(title: title, image: image, tag: icon.rawValue)
    }
}

public extension UIButton {

    /**
     Sets the icon to use for the specified state.

     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     */
    func setIconImage(withIcon icon: Icon, size: CGSize, color: UIColor?, forState state: UIControlState) {
        let image = icon.image(ofSize: size, color: color ?? .black)
        setImage(image, for: state)
    }
}

#endif

/** A list with available icon glyphs from the icon font. */
@objc public enum Icon: Int {
    case iconNumberIcon
    case iconTextIcon
    case iconAddIcon
    case iconAuthorIcon
    case iconCloseIcon
    case iconCommentsIcon
    case iconCopylinkIcon
    case iconFilterIcon
    case iconInfoIcon
    case iconInternetIcon
    case iconMoreactionsIcon
    case iconPublicIcon
    case iconShareIcon
    case iconSocialQQIcon
    case iconSocialQQspaceIcon
    case iconSocialMomentsIcon
    case iconSocialWechatIcon
    case iconSocialWeiboIcon
    case iconSubscribeIcon
    case iconUpdatetimeIcon

    /** The icon font's total count of available icons. */
    public static var count: Int { return 20 }
}

extension Icon : IconDrawable {

    /** The icon font's family name. */
    public static var familyName: String {
        return "iconfont"
    }

    /**
     Creates a new instance with the specified icon name.
     If there is no valid name is recognised, this initializer falls back to the first available icon.

     - parameter iconName: The icon name to use for the new instance.
     */
    public init(named iconName: String) {
        switch iconName.lowercased() {
        case "icon_number": self = .iconNumberIcon
        case "icon_text": self = .iconTextIcon
        case "icon_add": self = .iconAddIcon
        case "icon_author": self = .iconAuthorIcon
        case "icon_close": self = .iconCloseIcon
        case "icon_comments": self = .iconCommentsIcon
        case "icon_copylink": self = .iconCopylinkIcon
        case "icon_filter": self = .iconFilterIcon
        case "icon_info": self = .iconInfoIcon
        case "icon_internet": self = .iconInternetIcon
        case "icon_moreactions": self = .iconMoreactionsIcon
        case "icon_public": self = .iconPublicIcon
        case "icon_share": self = .iconShareIcon
        case "icon_social_qq": self = .iconSocialQQIcon
        case "icon_social_qqspace": self = .iconSocialQQspaceIcon
        case "icon_social_moments": self = .iconSocialMomentsIcon
        case "icon_social_wechat": self = .iconSocialWechatIcon
        case "icon_social_weibo": self = .iconSocialWeiboIcon
        case "icon_subscribe": self = .iconSubscribeIcon
        case "icon_updatetime": self = .iconUpdatetimeIcon
        default: self = Icon(rawValue: 0)!
        }
    }

    /** The icon's name. */
    public var name: String {
        switch self {
        case .iconNumberIcon: return "icon_number"
        case .iconTextIcon: return "icon_text"
        case .iconAddIcon: return "icon_add"
        case .iconAuthorIcon: return "icon_author"
        case .iconCloseIcon: return "icon_close"
        case .iconCommentsIcon: return "icon_comments"
        case .iconCopylinkIcon: return "icon_copylink"
        case .iconFilterIcon: return "icon_filter"
        case .iconInfoIcon: return "icon_info"
        case .iconInternetIcon: return "icon_internet"
        case .iconMoreactionsIcon: return "icon_moreactions"
        case .iconPublicIcon: return "icon_public"
        case .iconShareIcon: return "icon_share"
        case .iconSocialQQIcon: return "icon_social_qq"
        case .iconSocialQQspaceIcon: return "icon_social_qqspace"
        case .iconSocialMomentsIcon: return "icon_social_moments"
        case .iconSocialWechatIcon: return "icon_social_wechat"
        case .iconSocialWeiboIcon: return "icon_social_weibo"
        case .iconSubscribeIcon: return "icon_subscribe"
        case .iconUpdatetimeIcon: return "icon_updatetime"
        }
    }

    /** The icon's unicode. */
    public var unicode: String {
        switch self {
        case .iconNumberIcon: return "\u{E625}"
        case .iconTextIcon: return "\u{E626}"
        case .iconAddIcon: return "\u{E620}"
        case .iconAuthorIcon: return "\u{E610}"
        case .iconCloseIcon: return "\u{E621}"
        case .iconCommentsIcon: return "\u{E622}"
        case .iconCopylinkIcon: return "\u{E619}"
        case .iconFilterIcon: return "\u{E614}"
        case .iconInfoIcon: return "\u{E613}"
        case .iconInternetIcon: return "\u{E612}"
        case .iconMoreactionsIcon: return "\u{E616}"
        case .iconPublicIcon: return "\u{E611}"
        case .iconShareIcon: return "\u{E623}"
        case .iconSocialQQIcon: return "\u{E61B}"
        case .iconSocialQQspaceIcon: return "\u{E61A}"
        case .iconSocialMomentsIcon: return "\u{E61D}"
        case .iconSocialWechatIcon: return "\u{E61C}"
        case .iconSocialWeiboIcon: return "\u{E617}"
        case .iconSubscribeIcon: return "\u{E624}"
        case .iconUpdatetimeIcon: return "\u{E60F}"
        }
    }
}
