// Solution · Challenge 59 · CGAffineTransform

import CoreGraphics

func scaleThenTranslate(scale: CGFloat, tx: CGFloat, ty: CGFloat) -> CGAffineTransform {
    CGAffineTransform(scaleX: scale, y: scale)
        .concatenating(CGAffineTransform(translationX: tx, y: ty))
}

func rotation(degrees: CGFloat) -> CGAffineTransform {
    CGAffineTransform(rotationAngle: degrees * .pi / 180)
}

func flipVertically(height: CGFloat) -> CGAffineTransform {
    CGAffineTransform(scaleX: 1, y: -1)
        .concatenating(CGAffineTransform(translationX: 0, y: height))
}

func transformed(_ points: [CGPoint], by transform: CGAffineTransform) -> [CGPoint] {
    points.map { $0.applying(transform) }
}
