# 备忘录
为了学习UIkit和ios开发

MemoAPP2是没有持久化的，MemoAPP是基于coredata实现的持久化

整体软件结构使用MVC架构，其中在Main文件中使用Xcode进行View的开发，分别创建了tableview和editView两个部分。
Model部分设计了memo类和memolist类，memolist中以一个数组保存memo。但是在使用coredata的过程中，发现不需要实现memo，实际上coredata会为你生成一个相应的类，对应与本项目就是MemoModel。
Client部分采用controller作为view和model的处理。在tableview处理新建，删除等内容。在editView内容处理修改标题和内容，保存等。

一些小内容
*  在设计页面切换的时候，最好使用navigationController，这样的页面会生成相应的navigationItem以更好的返回页面（不是普通的类似于页面堆叠的效果）
*  在生成coredata对应子文件的时候，对于codegen属性最好使用manual（Manual/None: 如果选择了 Manual 或者 None，Xcode 将不会为你的实体自动生成子类文件。你需要自己手动创建和管理实体的子类。这种方式适合于需要完全控制实体类代码的情况，或者在实体类中添加自定义逻辑的情况。Category/Extension: 使用 Category 或者 Extension Codegen 选项时，Xcode 会为每个实体创建一个空的分类文件（或者扩展文件）。你可以在这个文件中添加自定义代码，而不会覆盖由 Core Data 自动生成的代码。这种方式适合于需要在实体类中添加自定义方法或属性的情况，而不希望影响由 Core Data 自动生成的代码。Class Definition: 选择 Class Definition 选项时，Xcode 将为每个实体生成一个完整的子类文件，包括属性声明、方法声明和实现。你可以在这个文件中查看和修改由 Core Data 自动生成的代码。这种方式适合于需要查看或修改实体类的代码，但不希望手动管理所有代码的情况。）感谢https://www.youtube.com/watch?v=NpRv5SgE6gQ的帮助
*  在设计点击一个cell切换到详情进行编辑时，先是在view连接线，但是仅仅这样不能传递参数，不知道对应的memo。所以后续tableView(_:didSelectRowAt:)中设计performsegue来手动执行，但是实现过程中出现点击一次生成两个页面的情况，解决办法是在prepare中添加shouldperformsegue来判断sender是否符合要求，从而是否传参，生成页面。
