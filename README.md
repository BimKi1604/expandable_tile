![Pub Version](https://img.shields.io/pub/v/expandable_tile)
![Likes](https://img.shields.io/pub/likes/expandable_tile)
![Popularity](https://img.shields.io/pub/popularity/expandable_tile)

### ☕ Buy Me a Coffee

[![Buy Me a Coffee](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png)](https://buymeacoffee.com/bimki)

# 🔽 Expandable Tile (Flutter)

A Flutter package that helps you expand or collapse widgets to show/hide content with customizable animations. It supports both horizontal and vertical directions and allows flexible customization to fit different UI needs.

---

## 🎬 Demo Video
![Demo](assets/demo.gif)

---

## 📱 Use Cases

- Expandable sections in forms or FAQs.
- Slide-in side menus or horizontal drawers.
- Toggle content areas with smooth transitions.
- Build custom accordion or collapsible lists.

---

## ✨ Features

- Show/hide widgets with various animation styles.
- Supports **vertical** and **horizontal** expansion.
- Support some animation types.
- Support change color, style title
- Change width title or use fit width base on length title
- Easily **customizable** animation types.
- Clean API for integration in different widget trees.
- Lightweight and fast.

---

## 🏗️ Architecture & Technologies


| Component             | Description                                                     |
|-----------------------|-----------------------------------------------------------------|
| `ExpandableTileView`  | Main widget to expand/collapse content with animation           |
| `ExpandableAnimation` | Enum to select animation type (e.g., size, fade, scale, def)    |
| `AxisExpand`          | Enum to control direction of expansion (horizontal or vertical) |
| `ExpandTileController`| Main controller to control state of expand (isExpand,axis,...)  |

---

## 🚀 Usage

### ✅ Basic Usage

#### 📏 Default Size Animation

##### Child Horizontally

```dart
ExpandableTileView.animatedDef(
  title: "Animation default horizontal",
  axis: AxisExpand.horizontal,
  posHorizontal: true,
  child: Text("his is demo for expand text vertical. The Child is Text."),
)
```

##### Child Vertically

```dart
ExpandableTileView.animatedDef(
  title: "Animation default horizontal",
  axis: AxisExpand.horizontal,
  child: Text("his is demo for expand text vertical. The Child is Text."),
)
```

#### 🌫️ Fade Animation

```dart
ExpandableTileView.animatedFade(
  title: "Animation fade",
  child: Text("Fading in and out!"),
)
```

#### 🔍 Scale Animation

```dart
ExpandableTileView.animatedScale(
  title: Text("Animation scale"),
  child: Text("Scaling animation!"),
)
```

---

## 🧾 Constructor Parameters

| Field              | Type                  | Default                    | Description                                                                   |
|--------------------|-----------------------|----------------------------|-------------------------------------------------------------------------------|
| `title`            | `String`              | **required**               | The widget displayed as the expandable tile's title.                          |
| `child`            | `Widget`              | **required**               | The content widget shown when expanded.                                       |
| `width`            | `double?`             | `null`                     | The width of the entire tile. If null, it adapts to the content.              |
| `axis`             | `AxisExpand`          | `AxisExpand.vertical`      | The direction of expansion: vertical or horizontal.                           |
| `titleBGColor`     | `Color?`              | `null`                     | Background color for the title section.                                       |
| `titleTextStyle`   | `TextStyle?`          | `null`                     | Text style for the title (if it's a `Text` widget).                           |
| `widthFill`        | `bool`                | `true`                     | If true, the total width of the ExpandableTile will fit title and child       |
| `posHorizontal`    | `bool`                | `false`                    | Applies only if `axis` is horizontal. If true, title on left, child on right. |

---

## ⚙️ Setup

To install the `expandable_tile` package, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  expandable_tile: ^1.0.0
