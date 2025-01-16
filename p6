import React, { createContext, useContext, useState, useEffect } from "react";

// Context to simulate the Bean Container
const BeanContext = createContext();

// BeanProvider to manage the lifecycle of beans
const BeanProvider = ({ children }) => {
  const [beans, setBeans] = useState({
    bean1: { name: "Bean 1", scope: "singleton", initialized: false },
    bean2: { name: "Bean 2", scope: "prototype", initialized: false },
  });

  // Initialize Beans
  useEffect(() => {
    console.log("Initializing Beans...");
    setBeans((prevBeans) =>
      Object.fromEntries(
        Object.entries(prevBeans).map(([key, bean]) => [
          key,
          { ...bean, initialized: true },
        ])
      )
    );
  }, []);

  // Simulate Dependency Injection
  const getBean = (beanName) => {
    const bean = beans[beanName];
    if (bean) {
      if (bean.scope === "prototype") {
        // For prototype scope, create a new instance
        return { ...bean, initialized: true };
      }
      return bean; // Return singleton instance
    }
    throw new Error(Bean ${beanName} not found!);
  };

  return (
    <BeanContext.Provider value={{ beans, getBean }}>
      {children}
    </BeanContext.Provider>
  );
};

// Component to display Bean Information
const BeanDisplay = () => {
  const { beans } = useContext(BeanContext);
  return (
    <div>
      <h2>Beans Overview</h2>
      <ul>
        {Object.entries(beans).map(([key, bean]) => (
          <li key={key}>
            <strong>{bean.name}</strong>: Initialized - {bean.initialized ? "Yes" : "No"}, Scope - {bean.scope}
          </li>
        ))}
      </ul>
    </div>
  );
};

// Component simulating a consumer of a bean
const BeanConsumer = ({ beanName }) => {
  const { getBean } = useContext(BeanContext);
  const [bean, setBean] = useState(null);

  useEffect(() => {
    try {
      const beanInstance = getBean(beanName);
      setBean(beanInstance);
    } catch (error) {
      console.error(error.message);
    }
  }, [beanName, getBean]);

  if (!bean) return <p>Loading {beanName}...</p>;

  return (
    <div>
      <h3>Bean Consumer</h3>
      <p>
        Using <strong>{bean.name}</strong> (Scope: {bean.scope})
      </p>
    </div>
  );
};

// Main Application
const App = () => {
  return (
    <BeanProvider>
      <div>
        <h1>Bean Management System</h1>
        <BeanDisplay />
        <BeanConsumer beanName="bean1" />
        <BeanConsumer beanName="bean2" />
      </div>
    </BeanProvider>
  );
};

export default App;
