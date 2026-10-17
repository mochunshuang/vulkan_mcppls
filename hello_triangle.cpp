
import std;
import vulkan;

class HelloTriangleApplication
{
  public:
    void run()
    {
        initVulkan();
        mainLoop();
        cleanup();
    }

  private:
    void initVulkan()
    {
        // 1. 应用信息（vk::ApplicationInfo）
        vk::ApplicationInfo appInfo{.pApplicationName = "Module Test",
                                    .applicationVersion = vk::makeVersion(1, 0, 0),
                                    .pEngineName = "No Engine",
                                    .engineVersion = vk::makeVersion(1, 0, 0),
                                    .apiVersion = vk::ApiVersion14};

        // 2. 实例创建信息（vk::InstanceCreateInfo）
        vk::InstanceCreateInfo createInfo{.pApplicationInfo = &appInfo};

        // 3. 创建实例（vk::createInstance）
        vk::Instance instance = vk::createInstance(createInfo);

        // 4. 销毁实例（vk::Instance::destroy）
        instance.destroy();

        std::println("Vulkan module is working.");
    }

    void mainLoop() {}

    void cleanup() {}
};

int main()
{
    HelloTriangleApplication app;

    try
    {
        app.run();
    }
    catch (const std::exception &e)
    {
        std::cerr << e.what() << std::endl;
        return 1;
    }

    return 0;
}