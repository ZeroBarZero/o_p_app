#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "NMFFoundation.h"

#pragma once

NS_ASSUME_NONNULL_BEGIN

#ifndef NS_STRING_ENUM
    #define NS_STRING_ENUM
    #define NS_EXTENSIBLE_STRING_ENUM
    typedef NSString *NSErrorDomain;
    typedef NSString *NSNotificationName;
#endif

/** Indicates an error occurred in the Mapbox SDK. */
extern NMF_EXPORT NSErrorDomain const NMFErrorDomain;

/** Error constants for the Mapbox SDK. */
typedef NS_ENUM(NSInteger, NMFErrorCode) {
    /** An unknown error occurred. */
    NMFErrorCodeUnknown = -1,
    /** The resource could not be found. */
    NMFErrorCodeNotFound = 1,
    /** The connection received an invalid server response. */
    NMFErrorCodeBadServerResponse = 2,
    /** An attempt to establish a connection failed. */
    NMFErrorCodeConnectionFailed = 3,
    /** A style parse error occurred while attempting to load the map. */
    NMFErrorCodeParseStyleFailed = 4,
    /** An attempt to load the style failed. */
    NMFErrorCodeLoadStyleFailed = 5,
    /** An error occurred while snapshotting the map. */
    NMFErrorCodeSnapshotFailed = 6,
};

/** Options for enabling debugging features in an `NMFMapView` instance. */
typedef NS_OPTIONS(NSUInteger, NMFMapDebugMaskOptions) {
    /** Edges of tile boundaries are shown as thick, red lines to help diagnose
        tile clipping issues. */
    NMFMapDebugTileBoundariesMask = 1 << 1,
    /** Each tile shows its tile coordinate (x/y/z) in the upper-left corner. */
    NMFMapDebugTileInfoMask = 1 << 2,
    /** Each tile shows a timestamp indicating when it was loaded. */
    NMFMapDebugTimestampsMask = 1 << 3,
    /** Edges of glyphs and symbols are shown as faint, green lines to help
        diagnose collision and label placement issues. */
    NMFMapDebugCollisionBoxesMask = 1 << 4,
    /** Each drawing operation is replaced by a translucent fill. Overlapping
        drawing operations appear more prominent to help diagnose overdrawing.
        @note This option does nothing in Release builds of the SDK. */
    NMFMapDebugOverdrawVisualizationMask = 1 << 5,
#if !TARGET_OS_IPHONE
    /** The stencil buffer is shown instead of the color buffer.
        @note This option does nothing in Release builds of the SDK. */
    NMFMapDebugStencilBufferMask = 1 << 6,
    /** The depth buffer is shown instead of the color buffer.
        @note This option does nothing in Release builds of the SDK. */
    NMFMapDebugDepthBufferMask = 1 << 7,
#endif
};

/**
 A structure containing information about a transition.
 */
typedef struct __attribute__((objc_boxable)) NMFTransition {
    /**
     The amount of time the animation should take, not including the delay.
     */
    NSTimeInterval duration;
    
    /**
     The amount of time in seconds to wait before beginning the animation.
     */
    NSTimeInterval delay;
} NMFTransition;

/**
 Creates a new `NMFTransition` from the given duration and delay.
 
 @param duration The amount of time the animation should take, not including 
 the delay.
 @param delay The amount of time in seconds to wait before beginning the 
 animation.
 
 @return Returns a `NMFTransition` struct containing the transition attributes.
 */
NS_INLINE NMFTransition NMFTransitionMake(NSTimeInterval duration, NSTimeInterval delay) {
    NMFTransition transition;
    transition.duration = duration;
    transition.delay = delay;
    
    return transition;
}

NS_ASSUME_NONNULL_END
