package com.software.software_takeout.util;

import java.util.Map;

public class ThreadLocalUtil<T> {
    private static final ThreadLocal THREAD_LOCAL = new ThreadLocal();

    public static <T> T get() {
        return (T) THREAD_LOCAL.get();
    }

    public static Long getId() {
        try {
            Integer id = (Integer) ((Map) THREAD_LOCAL.get()).get("id");
            return id.longValue();
        } catch (ClassCastException e) {
            return (Long) ((Map) THREAD_LOCAL.get()).get("id");
        }
    }

    public static String getPhone() {
        return (String) ((Map) THREAD_LOCAL.get()).get("phone");
    }

    public static void set(Object value) {
        THREAD_LOCAL.set(value);
    }

    public static void remove() {
        THREAD_LOCAL.remove();
    }
}
