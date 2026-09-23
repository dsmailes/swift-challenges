// ════════════════════════════════════════════════════════════════════════
//  Challenge 59 · CGAffineTransform                            Difficulty ★★☆
//  Interview question: "When would you use `CGAffineTransform`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An affine transform scales, rotates, translates (and skews) 2D geometry
//  while keeping parallel lines parallel. You'd use it to animate views
//  (`view.transform`), transform paths/points in Core Graphics, or flip a
//  coordinate system. ORDER MATTERS: scale-then-move is not the same as
//  move-then-scale. `a.concatenating(b)` applies `a` first, then `b`.
//  Beware: `t.translatedBy(x:y:)` applies the translation BEFORE `t`!
//
//  YOUR TASK
//  1. `scaleThenTranslate(scale:tx:ty:)` – first scale uniformly, then move
//     by (tx, ty). Point (1, 1) with scale 2 and tx 10 → (12, 2).
//  2. `rotation(degrees:)` – a rotation by the given number of DEGREES.
//  3. `flipVertically(height:)` – maps y to (height − y), leaving x alone.
//     (This converts between top-left and bottom-left origins.)
//  4. `transformed(_:by:)` – apply a transform to every point.
// ════════════════════════════════════════════════════════════════════════

import CoreGraphics

func scaleThenTranslate(scale: CGFloat, tx: CGFloat, ty: CGFloat) -> CGAffineTransform {
    // TODO
    .identity
}

func rotation(degrees: CGFloat) -> CGAffineTransform {
    // TODO
    .identity
}

func flipVertically(height: CGFloat) -> CGAffineTransform {
    // TODO
    .identity
}

func transformed(_ points: [CGPoint], by transform: CGAffineTransform) -> [CGPoint] {
    // TODO
    []
}
