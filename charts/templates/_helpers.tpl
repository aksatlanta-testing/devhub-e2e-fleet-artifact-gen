
{{- define "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.fullname" -}}
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


{{- define "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.labels" -}}
helm.sh/chart: {{ include "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.chart" . }}
{{ include "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08c7363e-d8ec-44a1-b971-8e8896da624b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}