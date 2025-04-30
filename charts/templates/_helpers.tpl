
{{- define "go-echoff88ec33-53a6-4441-916c-72dd5b316630.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff88ec33-53a6-4441-916c-72dd5b316630.fullname" -}}
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


{{- define "go-echoff88ec33-53a6-4441-916c-72dd5b316630.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff88ec33-53a6-4441-916c-72dd5b316630.labels" -}}
helm.sh/chart: {{ include "go-echoff88ec33-53a6-4441-916c-72dd5b316630.chart" . }}
{{ include "go-echoff88ec33-53a6-4441-916c-72dd5b316630.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff88ec33-53a6-4441-916c-72dd5b316630.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff88ec33-53a6-4441-916c-72dd5b316630.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}