
{{- define "go-echod695b919-b35a-4580-b98c-d7260a802579.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod695b919-b35a-4580-b98c-d7260a802579.fullname" -}}
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


{{- define "go-echod695b919-b35a-4580-b98c-d7260a802579.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod695b919-b35a-4580-b98c-d7260a802579.labels" -}}
helm.sh/chart: {{ include "go-echod695b919-b35a-4580-b98c-d7260a802579.chart" . }}
{{ include "go-echod695b919-b35a-4580-b98c-d7260a802579.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod695b919-b35a-4580-b98c-d7260a802579.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod695b919-b35a-4580-b98c-d7260a802579.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}