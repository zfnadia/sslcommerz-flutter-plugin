#import "SslcommerzFlutterPlugin.h"
#if __has_include(<sslcommerz_flutter_plugin/sslcommerz_flutter_plugin-Swift.h>)
#import <sslcommerz_flutter_plugin/sslcommerz_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sslcommerz_flutter_plugin-Swift.h"
#endif

@implementation SslcommerzFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSslcommerzFlutterPlugin registerWithRegistrar:registrar];
}
@end
