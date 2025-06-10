
{{- define "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.fullname" -}}
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


{{- define "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.labels" -}}
helm.sh/chart: {{ include "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.chart" . }}
{{ include "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa30840e4-9bc8-43fe-a53b-38f44a4c01d7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}