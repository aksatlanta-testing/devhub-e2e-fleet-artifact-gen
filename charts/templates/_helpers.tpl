
{{- define "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.fullname" -}}
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


{{- define "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.labels" -}}
helm.sh/chart: {{ include "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.chart" . }}
{{ include "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob42b9680-b76b-43c6-8ca9-0cf7a21f4227.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}