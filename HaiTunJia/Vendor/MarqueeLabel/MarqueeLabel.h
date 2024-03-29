
//
//  MarqueeLabel.h
//

#import <UIKit/UIKit.h>

/** An enum that defines the types of `MarqueeLabel` scrolling */
typedef NS_ENUM(NSUInteger, MarqueeType) {
    /** Scrolls left first, then back right to the original position. */
    MLLeftRight = 0,
    /** Scrolls right first, then back left to the original position. */
    MLRightLeft,
    /** Continuously scrolls left (with a pause at the original position if animationDelay is set). */
    MLContinuous,
    /** Continuously scrolls right (with a pause at the original position if animationDelay is set) */
    MLContinuousReverse
};


/**
 MarqueeLabel is a UILabel subclass adds a scrolling marquee effect when the text of a label instance outgrows the available width. Instances of `MarqueeLabel` can be configured
 for label scrolling direction/looping, speed/rate, and other options.
 */

@interface MarqueeLabel : UILabel

////////////////////////////////////////////////////////////////////////////////
/// @name Creating MarqueeLabels
////////////////////////////////////////////////////////////////////////////////

/** Returns a newly initialized `MarqueeLabel` instance.
 
 The default scroll duration of 7.0 seconds and fade length of 0.0 are used.
 
 @param frame A rectangle specifying the initial location and size of the view in its superview's coordinates. Text (for the given font, font size, etc.) that does not fit in this frame will automatically scroll.
 @return An initialized `MarqueeLabel` object or nil if the object couldn't be created.
 */

- (id)initWithFrame:(CGRect)frame;


/** Returns a newly initialized `MarqueeLabel` instance with the specified scroll rate and edge transparency fade length.
 
 You must specify a non-zero rate, and you cannot thereafter modify the rate.
 
 @param frame A rectangle specifying the initial location and size of the view in its superview's coordinates. Text (for the given font, font size, etc.) that does not fit in this frame will automatically scroll.
 @param pixelsPerSec A rate of scroll for the label scroll animation. Must be non-zero. Note that this will be the maximum rate for ease-type animation.
 @param fadeLength A length of transparency fade at the left and right edges of the `MarqueeLabel` instance's frame.
 @see fadeLength
 @return An initialized `MarqueeLabel` object or nil if the object couldn't be created.
 */

- (id)initWithFrame:(CGRect)frame rate:(CGFloat)pixelsPerSec andFadeLength:(CGFloat)fadeLength;


/** Returns a newly initialized `MarqueeLabel` instance with the specified scroll duration and edge transparency fade length.
 
 You must specify a non-zero duration, and you cannot thereafter modify the duration.
 
 @param frame A rectangle specifying the initial location and size of the view in its superview's coordinates. Text (for the given font, font size, etc.) that does not fit in this frame will automatically scroll.
 @param scrollDuration A scroll duration the label scroll animation. Must be non-zero. This will be the duration that the animation takes for one-half of the scroll cycle in the case of left-right and right-left marquee types, and for one loop of a continuous marquee type.
 @param fadeLength A length of transparency fade at the left and right edges of the `MarqueeLabel` instance's frame.
 @see fadeLength
 @return An initialized `MarqueeLabel` object or nil if the object couldn't be created.
 */

- (id)initWithFrame:(CGRect)frame duration:(NSTimeInterval)scrollDuration andFadeLength:(CGFloat)fadeLength;


/** Resizes the view to the minimum size necessary to fully enclose the current text (i.e. without scrolling), up to the maximum size specified.
 
 The current origin of the frame is retained.
 
 @param maxSize The maximum size up to which the view should be resized. Passing `CGSizeZero` will result in no maximum size limit.
 @param adjustHeight A boolean that can be used to indicate if the view's height should also be adjusted. Note that this has no impact on scrolling.
 */
- (void)minimizeLabelFrameWithMaximumSize:(CGSize)maxSize adjustHeight:(BOOL)adjustHeight;


////////////////////////////////////////////////////////////////////////////////
/// @name Configuration Options
////////////////////////////////////////////////////////////////////////////////

/** Specifies the animation curve used in the scrolling motion of the labels.
 
 Allowable options:
 
 - `UIViewAnimationOptionCurveEaseInOut`
 - `UIViewAnimationOptionCurveEaseIn`
 - `UIViewAnimationOptionCurveEaseOut`
 - `UIViewAnimationOptionCurveLinear`
 
 Defaults to `UIViewAnimationOptionCurveEaseInOut`.
 */

@property (nonatomic, assign) UIViewAnimationOptions animationCurve;


/** A boolean property that sets whether the `MarqueeLabel` should behave like a normal UILabel.
 
 When set to `YES` the `MarqueeLabel` will behave like a normal UILabel, and  will not begin scrolling when the text is
 larger than the specified frame. The change takes effect immediately. Note that the `MarqueeLabel` will respect the
 setting of the UILabel `lineBreakMode` and `textAlignment` properties while labelized.
 
 To simply prevent automatic scrolling, use the `holdScrolling` property.
 
 Defaults to `NO`.
 
 @see holdScrolling
 @see lineBreakMode
 @warning The label will not automatically scroll when this property is set to `YES`.
 @warning The UILabel default setting for the `lineBreakMode` property is `NSLineBreakByTruncatingTail`, which truncates the text adds an ellipsis glyph (...). Set the `lineBreakMode` property to `NSLineBreakByClipping` in order to avoid the ellipsis, especially if using an edge transparency fade.
 */

@property (nonatomic, assign) BOOL labelize;


/** A boolean property that sets whether the `MarqueeLabel` should hold (prevent) label scrolling
 
 When set to `YES`, the `MarqueeLabel` will not automatically scroll when its text is larger than the specified frame.
 Note that edge fades will be not be disabled when this property is set to `YES`.
 
 To set the `MarqueeLabel` to act like a normal UILabel, use the `labelize` property.
 
 Defaults to `NO` .
 
 @see labelize
 @warning The label will not automatically scroll when this property is set to `YES`.
 */

@property (nonatomic, assign) BOOL holdScrolling;


/** Defines the direction and method in which the `MarqueeLabel` instance scrolls.
 
 `MarqueeLabel` supports four types of scrolling: `MLLeftRight`, `MLRightLeft`, `MLContinuous`, and `MLContinuousReverse`.
 
 Given the nature of how text direction works, the options for the `marqueeType` property require specific text alignments
 and will set the textAlignment property accordingly.
 
 - `MLLeftRight` type is ONLY compatible with a label text alignment of `NSTextAlignmentLeft`.
 - `MLRightLeft` type is ONLY compatible with a label text alignment of `NSTextAlignmentRight`.
 - `MLContinuous` does not require a text alignment (it is effectively centered).
 - `MLContinuousReverse` does not require a text alignment (it is effectively centered).
 
 Defaults to `MLLeftRight`.
 
 @see MarqueeType
 @see textAlignment
 */

@property (nonatomic, assign) MarqueeType marqueeType;


/** The additional amount of space (in points) inbetween the strings of a continuous-type label.
 
 The minimum spacing is two times the specified fade length.
 
 Defaults to `0`.
 
 @see fadeLength
 */

@property (nonatomic, assign) CGFloat continuousMarqueeExtraBuffer;


/** The length of transparency fade at the left and right edges of the `MarqueeLabel` instance's frame.
 
 This propery sets the size (in points) of the view edge transparency fades on the left and right edges of a `MarqueeLabel`. The
 transparency fades from an alpha of 1.0 (fully visible) to 0.0 (fully transparent) over this distance. Values set to this property
 will be sanitized to prevent a fade length greater than 1/2 of the frame width.
 
 Defaults to `0`.
 */

@property (nonatomic, assign) CGFloat fadeLength;


/** The length of delay in seconds that the label pauses at the completion of a scroll. */

@property (nonatomic, assign) CGFloat animationDelay;


/** A boolean property that sets whether the `MarqueeLabel` should only begin a scroll when tapped.
 
 If this property is set to `YES`, the `MarqueeLabel` will begin a scroll animation cycle only when tapped. The label will
 not automatically being a scroll.
 
 Defaults to `NO` .
 
 @warning The label will not automatically scroll when this property is set to `YES`.
 */
@property (nonatomic, assign) BOOL tapToScroll;


////////////////////////////////////////////////////////////////////////////////
/// @name Animation control
////////////////////////////////////////////////////////////////////////////////

/** Restarts the label text scroll animation.
 
 The text is immediately returned to the home position, and the scroll animation will be begin again if the appropriate conditions are met.
 
 @see resetLabel
 */

- (void)restartLabel;


/** Resets the label text, recalculating the scroll animation.
 
 The text is immediately returned to the home position, and the scroll animation positions are cleared. Scrolling will not resume automatically after
 a call to this method. To re-initiate scrolling, use either a call to `restartLabel` or make a change to a UILabel property such as text, bounds/frame,
 font, font size, etc.
 
 @see restartLabel
 */

- (void)resetLabel;


/** Pauses the text scrolling animation, at any point during the animation.
 
 @see unpauseLabel
 */

- (void)pauseLabel;

/** Un-pauses a previously paused text scrolling animation
 
 @see pauseLabel
 */

- (void)unpauseLabel;


////////////////////////////////////////////////////////////////////////////////
/// @name Label States
////////////////////////////////////////////////////////////////////////////////

/** A boolean property that indicates if the label's scroll animation has been paused.
 
 @see pauseLabel
 @see unpauseLabel
 */

@property (nonatomic, assign, readonly) BOOL isPaused;


/** A boolean property that indicates if the label is currently away from the home location.
 
 The home location is approximately the traditional location of `UILabel` text. This property essentially
 reflects if a scroll animation is underway.
 */

@property (nonatomic, assign, readonly) BOOL awayFromHome;



////////////////////////////////////////////////////////////////////////////////
/// @name Bulk-manipulation Methods
////////////////////////////////////////////////////////////////////////////////

/** Convenience method to restart all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 This method sends a `NSNotification` to all `MarqueeLabel` instances with the specified view controller in their next responder chain.
 The scrolling animation of these instances will be automatically restarted. This is equivalent to calling `restartLabel` on all affected
 instances.
 
 There is currently no functional difference between this method and `controllerViewDidAppear:` or `controllerViewWillAppear:`. The methods may
 be used interchangeably.
 
 @warning View controllers that appear with animation (such as from underneath a modal-style controller) can cause some `MarqueeLabel` text
 position "jumping" when this method is used in `viewDidAppear` if scroll animations are already underway. Use this method inside `viewWillAppear:`
 instead to avoid this problem.
 
 @warning This method may not function properly if passed the parent view controller when using view controller containment.
 
 @param controller The view controller that has appeared.
 @see restartLabel
 @see controllerViewDidAppear:
 @see controllerViewWillAppear:
 @since Available in 1.3.1 and later.
 */

+ (void)restartLabelsOfController:(UIViewController *)controller;


/** Convenience method to restart all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 Alternative to `restartLabelsOfController:`. This method is retained for backwards compatibility and future enhancements.
 
 @param controller The view controller that has appeared.
 @see restartLabel
 @see controllerViewWillAppear:
 @since Available in 1.2.7 and later.
 */

+ (void)controllerViewDidAppear:(UIViewController *)controller;


/** Convenience method to restart all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 Alternative to `restartLabelsOfController:`. This method is retained for backwards compatibility and future enhancements.
 
 @param controller The view controller that has appeared.
 @see restartLabel
 @see controllerViewDidAppear:
 @since Available in 1.2.8 and later.
 */

+ (void)controllerViewWillAppear:(UIViewController *)controller;


/** Restarts all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 This method is intended to be placed in the `viewDidAppear:` method of view controllers, and sends an `NSNotification`
 to all `MarqueeLabel` instances with the specified view controller in their next responder chain. These instances
 will be automatically restarted.
 
 @param controller The view controller that has appeared.
 @see restartLabel
 @deprecated Use `controllerViewDidAppear:` instead.
 */

+ (void)controllerViewAppearing:(UIViewController *)controller __attribute((deprecated("Use restartLabelsOfController: method")));


/** Labelizes all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 This method sends an `NSNotification` to all `MarqueeLabel` instances with the specified view controller in their next
 responder chain. The `labelize` property of these `MarqueeLabel` instances will be set to `YES`.
 
 @param controller The view controller for which all `MarqueeLabel` instances should be labelized.
 @see labelize
 */

+ (void)controllerLabelsShouldLabelize:(UIViewController *)controller;


/** De-Labelizes all `MarqueeLabel` instances that have the specified view controller in their next responder chain.
 
 This method sends an `NSNotification` to all `MarqueeLabel` instances with the specified view controller in their next
 responder chain. The `labelize` property of these `MarqueeLabel` instances will be set to `NO` .
 
 @param controller The view controller for which all `MarqueeLabel` instances should be de-labelized.
 @see labelize
 */

+ (void)controllerLabelsShouldAnimate:(UIViewController *)controller;


@end


