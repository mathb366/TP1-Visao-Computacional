# 🫑 Processamento de Pimentões em Julia

Este repositório contém o código `TP1.jl` que realiza **segmentação de cores**, **filtragem**, **remoção de ruídos** e **detecção de bordas** em uma imagem de pimentões (`peppers.jpg`) usando a linguagem Julia. O código está separado em blocos, em que cada um faz uma segmentação diferente.

---

## 📂 Conteúdo

- `TP1.jl`: Código em Julia com múltiplas seções para processar a imagem `peppers.jpg`, segmentando pimentões por cor (amarelo, verde, vermelho e roxo/preto).
- `peppers.jpg`: Imagem base com diferentes pimentões coloridos.

---

## 🧰 Requisitos

### Linguagem

- Julia (>= v1.6)

### Bibliotecas Julia

Instale as bibliotecas necessárias com:

```julia
using Pkg
Pkg.add(["Images", "ImageView", "ImageFiltering", "OpenCV", "Statistics"])
