
{{- define "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.fullname" -}}
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


{{- define "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.labels" -}}
helm.sh/chart: {{ include "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.chart" . }}
{{ include "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe9d33f65-2080-4291-b36d-3659d7c55d47.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}