
{{- define "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.fullname" -}}
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


{{- define "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.labels" -}}
helm.sh/chart: {{ include "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.chart" . }}
{{ include "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44b385e5-d7c4-42f7-9a6c-a64ab1fda67b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}