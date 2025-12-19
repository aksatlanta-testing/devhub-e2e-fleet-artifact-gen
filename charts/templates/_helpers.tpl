
{{- define "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.fullname" -}}
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


{{- define "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.labels" -}}
helm.sh/chart: {{ include "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.chart" . }}
{{ include "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa5933897-f0b2-41dd-9d95-c6f2ed90f531.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}