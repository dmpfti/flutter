#import "FlutterekycPlugin.h"
#if __has_include(<flutterekyc/flutterekyc-Swift.h>)
#import <flutterekyc/flutterekyc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterekyc-Swift.h"
#endif

@implementation FlutterekycPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterekycPlugin registerWithRegistrar:registrar];
}
@end
