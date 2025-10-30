
{{- define "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.fullname" -}}
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


{{- define "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.labels" -}}
helm.sh/chart: {{ include "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.chart" . }}
{{ include "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4ffe78b6-ad12-47cc-b055-e83858fd09ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}