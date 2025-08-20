
{{- define "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.fullname" -}}
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


{{- define "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.labels" -}}
helm.sh/chart: {{ include "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.chart" . }}
{{ include "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo63a9603c-53bb-4e07-b47e-28974e7ecd7e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}