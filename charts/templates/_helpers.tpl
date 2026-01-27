
{{- define "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.fullname" -}}
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


{{- define "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.labels" -}}
helm.sh/chart: {{ include "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.chart" . }}
{{ include "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8681a8e-5388-4a9f-b5f5-1e0c2813591b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}