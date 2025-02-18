
{{- define "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.fullname" -}}
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


{{- define "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.labels" -}}
helm.sh/chart: {{ include "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.chart" . }}
{{ include "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacc41c0c-0e55-4231-a794-56fc88a8cdce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}