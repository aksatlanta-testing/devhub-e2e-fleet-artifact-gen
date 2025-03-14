
{{- define "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.labels" -}}
helm.sh/chart: {{ include "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.chart" . }}
{{ include "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof84a8c82-d44e-4a39-ab82-8452e9a3e849.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}