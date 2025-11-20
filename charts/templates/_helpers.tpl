
{{- define "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.fullname" -}}
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


{{- define "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.labels" -}}
helm.sh/chart: {{ include "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.chart" . }}
{{ include "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo25ad89ac-24d4-4c78-86d9-9dc092a60937.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}