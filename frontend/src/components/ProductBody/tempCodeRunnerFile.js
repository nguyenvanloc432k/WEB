useEffect(() => {
        const slide = setInterval(() => {
            setImgIndex(imgIndex + 1);
        }, 3000)
        return () => {
            clearInterval(slide)
        }
    }, [imgIndex])