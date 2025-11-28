
{{- define "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.fullname" -}}
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


{{- define "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.labels" -}}
helm.sh/chart: {{ include "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.chart" . }}
{{ include "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9afb54c-b8e4-4d0e-92b2-ae61b06fb31a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}