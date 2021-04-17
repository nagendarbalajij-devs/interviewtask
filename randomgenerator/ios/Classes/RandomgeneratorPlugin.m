#import "RandomgeneratorPlugin.h"
#if __has_include(<randomgenerator/randomgenerator-Swift.h>)
#import <randomgenerator/randomgenerator-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "randomgenerator-Swift.h"
#endif

@implementation RandomgeneratorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRandomgeneratorPlugin registerWithRegistrar:registrar];
}
@end
