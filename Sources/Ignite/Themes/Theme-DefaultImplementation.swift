//
// Theme-DefaultImplementation.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

/// Default implementation providing Bootstrap's default light theme values
public extension Theme {
    var accent: Color { Color(hex: "#0d6efd") }
    var secondaryAccent: Color { Color(hex: "#6c757d") }
    var success: Color { Color(hex: "#198754") }
    var info: Color { Color(hex: "#0dcaf0") }
    var warning: Color { Color(hex: "#ffc107") }
    var danger: Color { Color(hex: "#dc3545") }
    var offWhite: Color { Color(hex: "#f8f9fa") }
    var offBlack: Color { Color(hex: "#212529") }
    var primary: Color { Color(hex: "#212529") }
    var emphasis: Color { Color(hex: "#212529") }
    var secondary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.75) }
    var tertiary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.5) }
    var background: Color { Color(hex: "#ffffff") }
    var secondaryBackground: Color { Color(hex: "#e9ecef") }
    var tertiaryBackground: Color { Color(hex: "#f8f9fa") }
    var border: Color { Color(hex: "#dee2e6") }
    var heading: Color { .default }
    var syntaxHighlighterTheme: HighlighterTheme { .automatic }

    // Links
    var link: Color { Color(hex: "#0d6efd") }
    var linkHover: Color { Color(hex: "#0a58ca") }
    var linkDecoration: TextDecoration { .underline }

    // Font Families
    var monospaceFont: Font { .default }
    var font: Font { .default }

    // Font Sizes
    var rootFontSize: LengthUnit { .default }
    var bodyFontSize: LengthUnit { .default }
    var inlineCodeFontSize: LengthUnit { .default }
    var codeBlockFontSize: LengthUnit { .default }

    // Line Heights
    var lineHeight: LengthUnit { .default }

    // Heading Sizes
    var xxLargeHeadingSize: LengthUnit { .default }
    var xLargeHeadingSize: LengthUnit { .default }
    var largeHeadingSize: LengthUnit { .default }
    var mediumHeadingSize: LengthUnit { .default }
    var smallHeadingSize: LengthUnit { .default }
    var xSmallHeadingSize: LengthUnit { .default }

    // Heading Properties
    var headingFont: Font { .default }
    var headingFontWeight: FontWeight { .default }
    var headingLineHeight: LengthUnit { .default }

    // Bottom Margins
    var headingBottomMargin: LengthUnit { .default }
    var paragraphBottomMargin: LengthUnit { .default }

    // Breakpoints
    var smallBreakpoint: LengthUnit { .default }
    var mediumBreakpoint: LengthUnit { .default }
    var largeBreakpoint: LengthUnit { .default }
    var xLargeBreakpoint: LengthUnit { .default }
    var xxLargeBreakpoint: LengthUnit { .default }

    // Maximum widths
    var smallMaxWidth: LengthUnit { .default }
    var mediumMaxWidth: LengthUnit { .default }
    var largeMaxWidth: LengthUnit { .default }
    var xLargeMaxWidth: LengthUnit { .default }
    var xxLargeMaxWidth: LengthUnit { .default }
}

public extension Theme {
    /// The unique identifier for this theme instance, including any system-generated suffix.
    var id: String {
        Self.id
    }

    /// The display name of this theme instance.
    var name: String {
        Self.name
    }

    /// Internal identifier used for theme switching and CSS selectors.
    /// Automatically appends "-light" or "-dark" suffix based on protocol conformance.
    static var id: String {
        let baseID = name.kebabCased()

        guard baseID != "light" && baseID != "dark" else {
            return baseID
        }

        switch colorScheme {
        case .light: return baseID + "-light"
        case .dark: return baseID + "-dark"
        default: return baseID
        }
    }
}

extension Theme {
    /// The appearance mode this theme represents
    var colorScheme: ColorScheme {
        Self.colorScheme
    }

    /// The theme's breakpoint values with inheritance applied between breakpoints.
    var resolvedBreakpoints: ResponsiveValues {
        PublishingContext.shared.resolveBreakpoints(for: self)
    }

    /// The theme's container width values with inheritance applied between breakpoints.
    var resolvedSiteWidths: ResponsiveValues {
        PublishingContext.shared.resolveSiteWidths(for: self)
    }
}
