
{{- define "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.fullname" -}}
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


{{- define "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.labels" -}}
helm.sh/chart: {{ include "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.chart" . }}
{{ include "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77809428-118f-4a7d-93e7-7cf81d7eb27c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}