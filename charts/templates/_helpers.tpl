
{{- define "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.fullname" -}}
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


{{- define "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.labels" -}}
helm.sh/chart: {{ include "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.chart" . }}
{{ include "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob336c192-bae1-4c46-a134-c4d64a0d988c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}