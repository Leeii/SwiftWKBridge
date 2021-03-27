//
//  Message.swift
//  LydiaBox
//
//  Created by Octree on 2019/6/16.
//  Copyright © 2019 Octree. All rights reserved.
//

import Foundation
import WebKit

fileprivate extension Encodable {
    func toJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

public class Callback: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
    }
    var id: String
    weak var webView: WKWebView?

    public func invoke(_ args: Encodable...) {
        _invoke(args: args)
    }

    public func callAsFunction(_ args: Encodable...) {
        _invoke(args: args)
    }

    private func _invoke(args: [Encodable]) {
        do {
            let params = try args.map { try String(data: $0.toJSONData(), encoding: .utf8)! }.joined(separator: ", ")
            var source: String
            if params.count > 0 {
                source = "window.__bridge__.CBDispatcher.invoke('\(id)', \(params))"
            } else {
                source = "window.__bridge__.CBDispatcher.invoke('\(id)')"
            }
            webView?.evaluateJavaScript(source, completionHandler: nil)
        } catch {
            fatalError()
        }
    }

    deinit {
        let source = "window.__bridge__.CBDispatcher.remove('\(id)')"
        webView?.evaluateJavaScript(source, completionHandler: nil)
    }
}

protocol ArgsType: Decodable {
    
}

struct Args0: Decodable, ArgsType {
    
}

struct Args1<P0: Decodable>: Decodable, ArgsType {
    var arg0: P0
}

struct Args2<P0: Decodable, P1: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
}

struct Args3<P0: Decodable, P1: Decodable, P2: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
}


struct Args4<P0: Decodable, P1: Decodable, P2: Decodable, P3: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
    var arg3: P3
}

struct Args5<P0: Decodable, P1: Decodable, P2: Decodable, P3: Decodable, P4: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
    var arg3: P3
    var arg4: P4
}


struct Args6<P0: Decodable, P1: Decodable, P2: Decodable, P3: Decodable, P4: Decodable, P5: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
    var arg3: P3
    var arg4: P4
    var arg5: P5
}

struct Args7<P0: Decodable, P1: Decodable, P2: Decodable, P3: Decodable, P4: Decodable, P5: Decodable, P6: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
    var arg3: P3
    var arg4: P4
    var arg5: P5
    var arg6: P6
}


struct Args8<P0: Decodable, P1: Decodable, P2: Decodable, P3: Decodable, P4: Decodable, P5: Decodable, P6: Decodable, P7: Decodable>: Decodable, ArgsType {
    var arg0: P0
    var arg1: P1
    var arg2: P2
    var arg3: P3
    var arg4: P4
    var arg5: P5
    var arg6: P6
    var arg7: P7
}
