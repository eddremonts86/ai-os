# SPEC.md — The ros2_utils_tool v1.0, a tool for ROS2 activies with full UI support

## Problem

Hello HN,<p>one and a half years ago, I posted about the ros2_utils_tool, a toolkit for various daily ROS2 activities with full UI and partial CLI support [0]. After countless hours of more development and testing, we&#x27;ve finally hit version 1.0!<p>Since my last post, various new features were added, including UI based bag recording and playing with additional options, a tool to export any type of bag message to a yaml file, compressed image support for image conversion tools, a tool to send static or non-static transformations, support for ROS2 Kilted, Lyrical and Rolling. performance optimizations and stability improvements and more!<p>The requirements and installation steps are almost identical to earlier version. A working ROS2 distribution (minimum is Jazzy now) is required, as well as Qt5&#x2F;Qt6 for UI and convenience functionalities, the cv_bridge for transforming images to ROS and vice versa, libpcl-dev for point cloud operations and finally catch2_ros for unit testing.<p>You can install all dependencies (except for the ROS2 distribution itself) with the following command:<p><pre><code>    sudo apt install libopencv-dev ros-ROS_DISTRO_NAME-cv-bridge libpcl-dev qtbase5-dev qt6-base-dev ros-ROS_DISTRO_NAME-catch-ros2
</code></pre>
Example for ROS2 Jazzy:<p><pre><code>    sudo apt install libopencv-dev ros-jazzy-cv-bridge libpcl-dev qt6-base-dev qtbase5-dev qtbase5-dev ros-jazzy-catch-ros2
</code></pre>
Install the UI with the following steps:<p><pre><code>    cd path&#x2F;to&#x2F;your&#x2F;ros2_workspace&#x2F;src
    git clone https:&#x2F;&#x2F;github.com&#x2F;MaxFleur&#x2F;ros2_utils_tool.git
    cd path&#x2F;to&#x2F;your&#x2F;workspace&#x2F;
    colcon build --packages-select ros2_utils_tool
</code></pre>
Start the UI tool after sourcing your workspace:<p><pre><code>    cd path&#x2F;to&#x2F;your&#x2F;ros2_workspace&#x2F;src 
    source install&#x2F;setup.bash
    ros2 run ros2_utils_tool tool_ui
</code></pre>
Feel free to try it out. If you have another feature request or there is a bug you want to report, feel free to open a issue as well!Hope this tool can you help you in some of your ROS2 activities.<p>Cheers!<p>[0] <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=42888732">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=42888732</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49597230)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T11:51:04Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
