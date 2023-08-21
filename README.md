# truss-project
 Final design project for BU's EK301 - Mechanics I (statics) course.

## Introduction
For our final design of an optimized acrylic truss structure, we opted to maximize the maximum load to cost ratio. Our target was a max theoretical load of 50 oz and a load-cost ratio of 0.20. This is to achieve some safety factor over the 32 oz nominal load, similar to how a real bridge might be designed, to ensure reliability and be conscious of budget. In this case, the loading capacity of our truss is about 1.5x of the minimum required.

Regarding uncertainty, we chose to favor maximizing the load-to-cost-ratio over minimizing uncertainty. However, some effort was made to design the members with number lengths that were as accurate to the model as possible, rounding to the nearest tenth of an inch, to facilitate making precise cuts during assembly.

## Procedure
We made very slight adjustments to the truss design between the preliminary and final designs. These changes increased both our maximum load and load-cost ratio. Most notably, we found that altering the angles of members 5 and especially 9 would either increase or decrease our maximum load. Through iteration, we found a sweet spot for both members. This new configuration changed our critical member and distributed the load more evenly. This was discovered by adjusting one joint at a time and iterating through different designs until we found a passing compromise.

To construct our truss, we gathered the necessary materials: large strips of acrylic, X-Acto knife, and duct tape. We measure and make cuts to separate each member, then connect them using tape, referring to our adjusted preliminary design. It’s important that no member is connected at a joint in such a way that they are being stressed internally before any load is applied.

## Analysis
Our analysis improved from the preliminary design, as we learned to apply the buckling force formula to predict the theoretical maximum load, instead of applying an increasing load until a member exceeded its calculated buckling force. To minimize uncertainty, we used the lower-bound theoretical load as our benchmarking value. This way, we would be more likely to over-build than under-build.

## Results
![image](https://github.com/erasmus95/truss-project/assets/36201011/54586e05-076a-4bb6-8f83-e5b4ef2eae41)

![image](https://github.com/erasmus95/truss-project/assets/36201011/dee51ae3-1686-4313-8d73-c9eb6691f898)

Our finalized truss design is shown in Figure 1. As seen in the figure, the critical member is member 10 with a compressive force of 25.0 oz when the truss is loaded with 32.0 oz. All member lengths, internal forces, and buckling range (where applicable) are shown in Table 1. Overall, the structure has a theoretical maximum load of 52.8 ± 2.10 oz. The theoretical max load/cost ratio is 0.246 oz/$. The design has a total virtual cost of  $214.55.

## Discussion and Conclusion
Initially, our designs were rather unconventional, but we quickly found that the simpler trusses yielded better results. This can be confirmed by observing common truss structures in real life— for example, the same simple truss seen within cranes can be thought to extend to those seen in bridges. 

With our truss, we design and test knowing that it is difficult to reliably fasten each member with tape. Additionally, we have only been able to model our truss while making large assumptions such as infinite joint strength and no rotational movements. In reality, if we wanted to be more certain in our analysis, we would need to use more advanced methods to further interrogate our design. Compounding this uncertainty, we were not able to make each cut exactly straight or the perfect length, leading to a final design that is close but not a replica of the virtual model. 

An example of this uncertainty are the angles of members 5 and 9. Our model assumes the ideal angles that yield the maximum theoretical load. However, in construction because of using tape and not being able to make the lengths as precise as they are in the model, we expect greater uncertainty when testing the truss. For example, making the angles more vertical results in a shift of the load to member 6, potentially causing it to buckle earlier than member 10. 

We found it insightful to spend the effort to code the drawing of the output of our program to show the member numbers and the critical member(s). This gave us a rapid visual representation of our truss and allowed us to easily map the forces to the members. With the output generated for us, we could rapidly iterate on our design and see both numerically and visually how it improved.

Finally, if we were to design a truss again, we would start out focusing on the load-to-cost ratio instead of purely maximizing the load capacity. Additionally, we feel that the tape is the greatest source of uncertainty in this project. We would revise the project to use some sort of rigid joint to slot members into, or a plastic cement that bonds the acrylic members together.


